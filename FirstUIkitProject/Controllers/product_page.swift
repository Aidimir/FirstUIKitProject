//
//  product_page.swift
//  FirstUIkitProject
//
//  Created by Айдимир Магомедов on 21.01.2022.
//

import SwiftUI

struct Page : View{
    var images : Array<Image>
    var mainImage : Image
    var productName : String
    var description : String
    var price : Int
    var body: some View{
        GeometryReader{ geometry in
                ZStack{
            ScrollView{
                VStack{
                    Text(productName)
                        .fontWeight(.bold)
                        .frame(width: geometry.size.width, height: .infinity, alignment: .leading)
                        .padding(Edge.Set.leading,geometry.size.width*0.02)
        TabView{
            ForEach(0..<images.count){ num in
                images[num]
                    .resizable()
                    .scaledToFit()
                    .shadow(color: .black.opacity(0.6), radius: 20, x: 20, y: 10)
                    .padding(Edge.Set.top,geometry.size.height*0.02)
                    .tag(num)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(width: .infinity, height: geometry.size.height*0.4, alignment: .center)
        .padding(Edge.Set.leading)
        .ignoresSafeArea(edges: Edge.Set.top)
                    Text("\(price) RUB")
                        .bold()
                        .font(.system(size: 25))
                    ScrollView{
                Text(description)
                    .frame(width: geometry.size.width, height: .infinity, alignment: .leading)
                    .padding(Edge.Set.top,geometry.size.height*0.02)
                    .padding(.leading,geometry.size.width*0.02)
                    }
                }

        }
                    ZStack{
                Rectangle()
                    .fill(.black)
                    .cornerRadius(10)
                    .frame(width: geometry.size.width*0.95, height: geometry.size.height*0.08, alignment: .center)
                        Text("В корзину")
                            .foregroundColor(.white)
                            .bold()
                            .font(.system(size: 28))
                    }
                    .position(x: geometry.size.width*0.5, y: geometry.size.height*0.95)

            }
        }

    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            Page(images: [Image(systemName: "leaf.fill"),Image(systemName: "leaf"),Image(systemName: "leaf.fill")], mainImage: Image(systemName: "leaf"), productName: "Leaf", description: "IT'S A REGULAR LEAF ! THERE IS A LOT LEAFS LIKE THAT , BUT THIS IS MINE ! WITHOUT ME MI LEAF IS NOTHING, WITHOUT LEAF NOTHING IS ME !IT'S A REGULAR LEAF ! THERE IS A LOT LEAFS LIKE THAT , BUT THIS IS MINE ! WITHOUT ME MI LEAF IS NOTHING, WITHOUT LEAF NOTHING IS ME !IT'S A REGULAR LEAF ! THERE IS A LOT LEAFS LIKE THAT , BUT THIS IS MINE ! WITHOUT ME MI LEAF IS NOTHING, WITHOUT LEAF NOTHING IS ME !", price: 1)
        }
    }
}
