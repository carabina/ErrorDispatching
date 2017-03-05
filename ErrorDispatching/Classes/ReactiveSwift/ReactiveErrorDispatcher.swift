//
//  ReactiveErrorDispatcher.swift
//  ErrorDispatching
//
//  Created by Anatoliy Radchenko on 05/03/2017.
//
//

import Foundation
import ReactiveSwift

open class ReactiveErrorDispatcher: ErrorDispatcher {
    public var methodExecution: Property<ErrorHandlingMethod> { return Property(_methodExecution) }
    
    fileprivate let _methodExecution: MutableProperty<ErrorHandlingMethod> = MutableProperty(.ignore)
    
    override public init(mainProposer: MethodProposing,
                         trailingProposer: TrailingProposer = .`default`) {
        super.init(
            mainProposer: mainProposer,
            trailingProposer: trailingProposer
        )
        
        self.executor = self
    }
}

//MARK: MethodExecutor
extension ReactiveErrorDispatcher: MethodExecutor {
    public func execute(method: ErrorHandlingMethod) {
        _methodExecution.value = method
    }
}
