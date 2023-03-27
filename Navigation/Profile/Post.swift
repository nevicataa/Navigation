//
//  Post.swift
//  Navigation
//
//  Created by Ekaterina on 22.03.2023.
//

import Foundation

struct Post {
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
}

let pie = Post(author: "Рецепты", description: "Смешать муку, пудру, добавить масло кусочками, перетереть в крошку, добавить желток. Замесить тесто не вымешивая его сильно, как собралось в комок значит и готово. Завернуть в пленку и убрать в холодильник на 30 мин.               Мякоть тыквы с сахаром пробить блендером до однородной массы, затем добавить яйца, белок и крахмал, хорошо перемешать. Можно добавить в начинку сок половины апельсина и цедру одного апельсина.", image: "pie.png", likes: 150, views: 300)
let yae = Post(author: "Игры", description: "Обновление 2.4", image: "Yae.png", likes: 600, views: 1000)
let season = Post(author: "Новости города", description: "В понедельник ожидается похолодание до +5.", image: "Осень.png", likes: 36, views: 100)
let animal = Post(author: "Cats", description: "Гладьте кошку так, как ей больше всего нравится, и она будет вам по-настоящему благодарна.Задняя область и хвост Хвост и область ниже основания хвоста - не самое приятное место для кошек. Поэтому поглаживания в этой области считаются неприятными и допускаются крайне редко. Тоже касается и задних лап кошки. Многие кошки любят, когда им гладят лапы. Мягкое поглаживание подушечек лап кошкам тоже понравится. Сами когти область вокруг них очень чувствительны, поэтому гладить их нужно кончиками пальцев.", image: "Cat.png", likes: 112, views: 457)

let postArray = [pie, animal, season, yae]