//
//  SearchDebouncer.swift
//  Wildzone
//
//  Created by Назар Ткаченко on 12.08.2024.
//

import Foundation

/// **SearchDebouncer**
///
/// Класс `SearchDebouncer` предназначен для реализации паттерна "дебаунс" (debounce).
/// Этот паттерн используется для ограничения частоты вызова функции,
/// гарантируя, что она будет вызвана не чаще, чем указанный интервал времени.
///
/// Дебаунс особенно полезен в случаях частых событий, таких как ввод текста пользователем,
/// чтобы уменьшить нагрузку на систему и/или сервер, обрабатывая события с задержкой.

final class SearchDebouncer {
    private var currentWorkItem: DispatchWorkItem?
    
    func debounce(interval: TimeInterval, block: @escaping () -> Void) {
        // Отменить предыдущую задачу
        currentWorkItem?.cancel()
        
        // Создать новую задачу
        currentWorkItem = DispatchWorkItem(block: block)
        
        // Разместить новую задачу после указанного интервала
        if let workItem = currentWorkItem {
            DispatchQueue.main.asyncAfter(deadline: .now() + interval, execute: workItem)
        }
    }
}
