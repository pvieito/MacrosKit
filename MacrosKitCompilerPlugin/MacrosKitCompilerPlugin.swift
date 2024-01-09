//
//  MacrosKitCompilerPlugin.swift
//  MacrosKitCompilerPlugin
//
//  Created by Pedro José Pereira Vieito on 09/01/2024.
//  Copyright © 2024 Pedro José Pereira Vieito. All rights reserved.
//

import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct MacrosKitCompilerPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        URLMacro.self,
        SymbolMacro.self,
        AssociatedValuesMacro.self,
        SingletonMacro.self
    ]
}
