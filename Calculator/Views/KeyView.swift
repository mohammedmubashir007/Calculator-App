//
//  keyView.swift
//  Calculator
//
//  Created by Mohammed Mubashir on 17/02/23.
//

import SwiftUI

struct KeyView: View {
    
    @State var value = "0"
    @State var runningNumber = 0
    @State var currentOperation:Operation = .none
    @State private var changeColor = true
    
    let buttons : [[Keys]] = [
        
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
        
    ]
    
    var body: some View {
        VStack{
            Spacer()
            HStack {
                RoundedRectangle(cornerRadius: 15).foregroundColor(changeColor ? Color("NumKeys").opacity(0.4) : Color.pink.opacity(0.2))
                    .scaleEffect(changeColor ? 1.5 : 1.0)
                    .frame(width: 350,height: 280)
                    .animation(Animation.easeInOut.speed(0.17).repeatForever(),value: changeColor)
                    .onAppear(perform: {
                        self.changeColor.toggle()
                    })
                    .overlay(Text(value))
                    .bold()
                    .font(.system(size: 100))
                    .foregroundColor(.black)
            }.padding()
            
            ForEach(buttons,id: \.self){ row in
                
                HStack(spacing: 10) {
                    ForEach(row, id: \.self){ element in
                        
                        Button {
                            self.didTap(button: element)
                        } label: {
                            Text(element.rawValue)
                                .font(.system(size: 30))
                                .frame(width:getWidth(element: element),height: getHeight(element: element))
                                .background(element.buttonColor)
                                .foregroundColor(.black)
                                .cornerRadius(getWidth(element: element)/2)
                                .shadow(color: .purple.opacity(0.8), radius:30)
                                
                        }
                    }
                }.padding(.bottom,4)
                
            }
        }
        
    }
    
    
    
    func getWidth(element:Keys) -> CGFloat {
        
        if element == .zero {
            return (UIScreen.main.bounds.width - (5*10)) / 2
        }

        return (UIScreen.main.bounds.width - (5*10)) / 4
    }
    
    
    
    func getHeight(element:Keys) -> CGFloat {
        return (UIScreen.main.bounds.width - (5*10)) / 5
    }
    
    
    func didTap(button:Keys){
        print("Mubashir")
    }
    
    
    
}
struct KeyView_Previews: PreviewProvider {
    static var previews: some View {
        KeyView()
    }
}
