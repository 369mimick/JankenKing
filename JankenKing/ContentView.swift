//
//  ContentView.swift
//  Janken
//
//  Created by 川上味禄 on 2022/09/23.
//

import SwiftUI

var win = 0

func winCount() {
    win += 1
}
struct ContentView: View {
    
    @State var answerNumber = 0
    @State var playerNumber = 1

    
    var body: some View {
        
        VStack {
            // スペースを追加
            Spacer()
            
            //じゃんけんの数字が0だったら
            if answerNumber == 0 {
                // 初期画面のテキストを表示
                Text("Please tap any buttons!")
                    .font(.title)
                // 下辺に余白を設定
                    .padding(.bottom)
            } else if answerNumber == 1 {
                // じゃんけんの数字が1だったら、グー画像を指定
                // グー
                Image("gu-en")
                // リサイズ
                    .resizable()
                //画面内に収まるように、アスペクト比(縦横比)を維持
                    .aspectRatio(contentMode: .fit)
                
                // スペースを追加
                Spacer()
                
                // 下辺に余白を設定
                    .padding(.bottom)
                
            } else if answerNumber == 2 {
                // じゃんけんの数字が2だったら、チョキを指定
                // チョキ
                Image("choki-en")
                // リサイズ
                    .resizable()
                //画面内に収まるように、アスペクト比(縦横比)を維持
                    .aspectRatio(contentMode: .fit)
                
                // スペースを追加
                Spacer()
                
                // 下辺に余白を設定
                    .padding(.bottom)
                
            } else {
                // じゃんけんの数字が｢1｣か｢2｣以外だったら、パー画像を指定
                // パー
                Image("pa-en")
                // リサイズ
                    .resizable()
                //画面内に収まるように、アスペクト比(縦横比)を維持
                    .aspectRatio(contentMode: .fit)
                
                // スペースを追加
                Spacer()
                
                // 下辺に余白を設定
                    .padding(.bottom)
            }
            
            //グーとチョキの枠組み
            HStack {
                
                Button(action: {
                    answerNumber = Int.random(in: 1...9999) % 3 + 1
                    playerNumber = 1
                }) {
                    VStack {
                        Image("gu-player")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 150)
                            .background(Color.pink)
                        
                        Text("グー")
                            .frame(maxWidth: .infinity)
                            .frame(height: 30)
                            .font(.title)
                            .background(Color.pink)
                            .foregroundColor(Color.white)
                    }
                }

                Button(action: {
                    answerNumber = Int.random(in: 1...9999) % 3 + 1
                    playerNumber = 2
                }) {
                    VStack {
                        Image("choki-player")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 150)
                            .background(Color.purple)
                        
                        Text("チョキ")
                            .frame(maxWidth: .infinity)
                            .frame(height: 30)
                            .font(.title)
                            .background(Color.purple)
                            .foregroundColor(Color.white)
                    }
                }

            } //HStackここまで

            Button(action: {
                answerNumber = Int.random(in: 1...9999) % 3 + 1
                playerNumber = 3
            }) {
                VStack {
                    Image("pa-player")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 150)
                        .background(Color.blue)
                    
                    Text("パー")
                        .frame(maxWidth: .infinity)
                        .frame(height: 25)
                        .font(.title)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                }
            } // パーのButtonここまで
            
            

            // playerがグーを選択した場合
            if playerNumber == answerNumber {
                Text("Draw")
                    .font(.title)
            } else if playerNumber == 1 && answerNumber == 2 {
                Text("You win !!")
                    .font(.title)
            } else if playerNumber == 2 && answerNumber == 3 {
                Text("You win !!")
                    .font(.title)
            } else if playerNumber == 3 && answerNumber == 1 {
                Text("You win !!")
                    .font(.title)
            } else if playerNumber == 1 && answerNumber == 3 {
                Text("You lose ...")
                    .font(.title)
            } else if playerNumber == 2 && answerNumber == 1 {
                Text("You lose ...")
                    .font(.title)
            } else if playerNumber == 3 && answerNumber == 2 {
                Text("You lose ...")
                    .font(.title)
            }
            
        } // VStack ここまで
    } // body ここまで
} // ContentView ここまで

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
