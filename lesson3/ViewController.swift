//
//  ViewController.swift
//  lesson3
//
//  Created by sebastian on 15.08.24.
//

import UIKit

typealias Subjects = (averageYearValue: Float, quarterMarks: [Int])

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //    Задания:
        //    ❇️ Массивы
        //    💬 Используем только функции высшего порядка.
        //
        //    ⭕️ Создать массив с 10 числами типа Int, которые рандомно сгенерированы в диапазоне 1-100
        
        
        var array: [Int] = []
        for item in 1...10 {
            array.append(Int.random(in: 1...100))
        }
        
        //        Пройтись по массиву и вывести в строке каждый элемент, например "Мне X лет"
        array.forEach { item in print("Мне \(item) лет") }
        
        //        Из массива с числами получить новый массив, который содержит только совершеннолетний возраст ( > 18).
        var adults = array.filter { $0 > 18 }
        print(adults)
        
        //        Из этого массива удалить пенсионеров ( < 60)
        
        adults = adults.filter { $0 < 60 }
        print(adults)
        
        //        Вывести в строке каждый элемент массива,  например "Мне Х лет, я ни молодой ни старый
        
        adults.forEach { item in print("Мне \(item) лет, я ни молодой ни старый") }
        //        Получить новый массив с элементами из первого массива, которые меньше среднего арифметического элементов этого же массива.
        
        let arrayArithmeticMean = array.filter { $0 < array.reduce(0) { $0 + $1 } / array.count }
        print(arrayArithmeticMean)
        
        //        Создать словарь, где ключ - название школьного предмета, а значение - среднегодовая отметка и массив отметок по четвертям (исп. кортежи).
        //        💬 Предметов должно быть 10
        
        let subjects: [String: Subjects] =
        [
            "Math": generateSubjectMarks(),
            "Сhemistry": generateSubjectMarks(),
            "Biology": generateSubjectMarks(),
            "Pe": generateSubjectMarks(),
            "History": generateSubjectMarks(),
            "Training": generateSubjectMarks(),
            "Physics": generateSubjectMarks(),
            "Geometry": generateSubjectMarks(),
            "Algebra": generateSubjectMarks(),
            "Work": generateSubjectMarks()
        ]
        
        //        Пройтись по словарю и вывести полную информацию по каждому предмету.
        //       💬 Название, годовая, оценки по четвертям
        
        subjects.forEach { key, value in
            print("Название: \(key), годовая: \(value.0), оценки по четвертям: \(value.1)")
        }
        
        //        Посчитайте и выведите общее количество отметок за год.
        //        💬 Годовые не считаются
        
        // через функцию высшего порядка скорее всего здесь не получится
        
//        var marks = [Int]()
//        for (kind, item) in subjects {
//            for item in item.1 {
//                marks.append(item)
//            }
//        }
//        print(" общее количество отметок за год: \(marks.count)")
        
        var marks = 0
        subjects.forEach { marks += $0.value.quarterMarks.count }
        print(" общее количество отметок за год: \(marks)")
    }
    func generateSubjectMarks() -> Subjects {
            let quarterMarks = (.zero..<4).map { _ in Int.random(in: 1...10) }
            let averageYearsValue = Float(quarterMarks.reduce(0, +)) / Float(quarterMarks.count)

            return Subjects(averageYearValue: averageYearsValue, quarterMarks: quarterMarks)
        }
}
