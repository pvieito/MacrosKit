//
//  AssociatedValuesMacro.swift
//  MacrosKitCompilerPlugin
//
//  Created by Pedro José Pereira Vieito on 09/01/2024.
//  Copyright © 2024 Pedro José Pereira Vieito. All rights reserved.
//

import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct AssociatedValuesMacro: MemberMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        guard let enumDecl = declaration.as(EnumDeclSyntax.self) else {
            throw AssociatedValuesMacroError.notAEnum
        }
        
        return try enumDecl.memberBlock.members.compactMap {
            $0.decl.as(EnumCaseDeclSyntax.self)?
                .elements
                .compactMap { $0 }
        }
        .reduce([], +)
        .compactMap { element -> DeclSyntax? in
            guard let associatedValue = element.parameterClause else {
                return nil
            }
            
            let variableNames = associatedValue
                .parameters
                .enumerated()
                .map { index, _ in
                    "v\(index)"
                }
                .joined(separator: ", ")
            
            return DeclSyntax(
                try VariableDeclSyntax("\(declaration.modifiers)var \(element.name)Value: \(raw: associatedValue)?") {
                    try IfExprSyntax("if case let .\(element.name)(\(raw: variableNames)) = self") {
                        if associatedValue.parameters.count == 1 {
                            "return \(raw: variableNames)"
                        } else {
                            "return (\(raw: variableNames))"
                        }
                    }
                    "return nil"
                }
            )
        }
    }
}

enum AssociatedValuesMacroError: Error, CustomStringConvertible {
    case notAEnum
    
    var description: String {
        switch self {
        case .notAEnum:
            "Can only be applied to enum"
        }
    }
}
