//
//  ViewController.swift
//  lesson3
//
//  Created by sebastian on 15.08.24.
//

import UIKit

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
        var adult = array.filter { $0 > 18 }
        print(adult)
        
        //        Из этого массива удалить пенсионеров ( < 60)
        
        adult = adult.filter { $0 < 60 }
        print(adult)
        
        //        Вывести в строке каждый элемент массива,  например "Мне Х лет, я ни молодой ни старый
        
        adult.forEach { item in print("Мне \(item) лет, я ни молодой ни старый") }
        //        Получить новый массив с элементами из первого массива, которые меньше среднего арифметического элементов этого же массива.
        
        let arrayArithmeticMean = array.filter { $0 < array.reduce(0) { $0 + $1 } / array.count }
        print(arrayArithmeticMean)
        
        //        Создать словарь, где ключ - название школьного предмета, а значение - среднегодовая отметка и массив отметок по четвертям (исп. кортежи).
        //        💬 Предметов должно быть 10
        
        let subject =
        [
            "Math": (findTheAverageAnnual(createRandomMarksDb()), createRandomMarksInt())
            ,
            
            "Сhemistry": (findTheAverageAnnual(createRandomMarksDb()), createRandomMarksInt())
            ,
            
            "Biology": (findTheAverageAnnual(createRandomMarksDb()), createRandomMarksInt())
            ,
            
            "Pe": (findTheAverageAnnual(createRandomMarksDb()), createRandomMarksInt())
            ,
            
            "History": (findTheAverageAnnual(createRandomMarksDb()), createRandomMarksInt())
            ,
            
            "Training": (findTheAverageAnnual(createRandomMarksDb()), createRandomMarksInt())
            ,
            
            "Physics": (findTheAverageAnnual(createRandomMarksDb()), createRandomMarksInt())
            ,
            
            "Geometry": (findTheAverageAnnual(createRandomMarksDb()), createRandomMarksInt())
            ,
            
            "Algebra": (findTheAverageAnnual(createRandomMarksDb()), createRandomMarksInt())
            ,
            
            "Work": (findTheAverageAnnual(createRandomMarksDb()), createRandomMarksInt())
        ]
        
        //        Пройтись по словарю и вывести полную информацию по каждому предмету.
        //       💬 Название, годовая, оценки по четвертям
        
        subject.forEach { key, value in
            print("Название: \(key), годовая: \(value.0), оценки по четвертям: \(value.1)")
        }
        
        //        Посчитайте и выведите общее количество отметок за год.
        //        💬 Годовые не считаются
        
        // через функцию высшего порядка скорее всего здесь не получится
        
        var marks = [Int]()
        for (kind, item) in subject {
            for item in item.1 {
                marks.append(item)
            }
        }
        print(" общее количество отметок за год: \(marks.count)")
    }
    func createRandomMarksDb() -> [Double] {
        var array: [Double] = []
        for item in 1...4 {
            array.append(Double.random(in: 1...10).rounded(.toNearestOrAwayFromZero))
        }
        return array
    }
    
    func createRandomMarksInt() -> [Int] {
        var array: [Int] = []
        for item in 1...4 {
            array.append(Int.random(in: 1...10))
        }
        return array
    }
    
    func findTheAverageAnnual(_ marks: [Double]) -> Double {
            let average = marks.reduce(0) { $0 + $1 } / Double(marks.count)
        return average
    }
}
