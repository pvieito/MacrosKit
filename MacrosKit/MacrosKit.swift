//
//  MacrosKit.swift
//  MacrosKit
//
//  Created by Pedro José Pereira Vieito on 09/01/2024.
//  Copyright © 2024 Pedro José Pereira Vieito. All rights reserved.
//

import Foundation

@freestanding(expression)
public macro URL(_ string: String) -> URL = #externalMacro(module: "Macros", type: "URLMacro")

@attached(member, names: arbitrary)
public macro AssociatedValues() = #externalMacro(module: "Macros", type: "AssociatedValuesMacro")
