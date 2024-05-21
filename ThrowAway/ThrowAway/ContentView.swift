//
//  ContentView.swift
//  ThrowAway
//
//  Created by Wang, Alyssa on 1/10/24.
//

import SwiftUI
import AVFAudio


struct ContentView: View {
    @State private var messageString = ""
    private var bgColor = Color.red
    
    @State private var imageString = ""
    @State private var imageNum = 0
    
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    
    @State private var audioPlayer: AVAudioPlayer!
    @State private var lastSoundNumber = -1
    
    @State private var soundIsOn = true
    
    //   @State private var
    
    
    @State private var strNum = 0
    
    
    
    var body: some View {
        
        //ZStack {
           /* Rectangle()
                .fill(
                    Gradient(colors: [.white, Color("lavender")])
                )
                .ignoresSafeArea() */
            
            GeometryReader {geometry in
                VStack {
                    /*  Text("You have skills!")
                     .font(.largeTitle)
                     .fontWeight(.black)
                     .foregroundColor(Color("RoseGold"))
                     .padding()
                     .background(Color("Scarlet"))
                     .cornerRadius(15) */
                    
                    
                    /* Image(systemName: imageString)
                     .resizable()
                     .scaledToFit()
                     .padding()
                     .padding()
                     .foregroundColor(.white)
                     .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.purple]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                     .cornerRadius(30.0)
                     .padding() */
                    
                    Spacer()
                    
                    Text(messageString)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.accentColor)
                        .frame(height: 150)
                        .frame(maxWidth: .infinity)
                        .animation(.easeInOut(duration: 0.15), value: messageString)
                    
                    Image(imageString)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(30)
                        .padding()
                        .shadow(radius: 30)
                        .padding()
                        .animation(.default, value: messageString)
                    
                    
                    
                    /*  Image(systemName: "speaker.wave.3", variableValue: num)
                     .resizable()
                     .scaledToFit()
                     
                     //.symbolRenderingMode(.palette)
                     // .foregroundStyle(.white, .yellow, .blue)
                     
                     .padding()
                     .foregroundColor(.black)
                     .background(Color("SkyBlue"))
                     
                     //.clipShape(Circle())
                     
                     .cornerRadius(30)
                     .shadow(color: . gray, radius: 30, x:20, y:20)
                     
                     
                     .overlay(
                     RoundedRectangle(cornerRadius: 30)
                     .stroke(.teal, lineWidth: 1)
                     )
                     
                     .padding() */
                    
                    
                    // .background(.yellow)
                    
                    
                    
                    /*  Divider()
                     .background(.black)
                     .padding()
                     .frame(width: 150.0) */
                    
                    
                    /*        Rectangle()
                     .fill(.indigo)
                     .frame(width: geometry.size.width * (2/3), height: 1) */
                    
                    
                    /*  HStack {
                     
                     
                     /* Button("Volume Up") {
                      num += 0.30
                      
                      if (num >= 1) {
                      messageString = "max volume reached!"
                      num = 1
                      } else {
                      messageString = ""
                      }
                      }
                      .buttonStyle(.borderedProminent)
                      
                      Button("Volume down") {
                      num -= 0.35
                      if (num <= 0) {
                      messageString = "min volume reached!"
                      num = 0
                      } else {
                      messageString = ""
                      }
                      }
                      .buttonStyle(.borderedProminent) */
                     
                     } */
                    
                    
                    Spacer()
                    
                    HStack {
                        
                        Text("Sound On: ")
                        Toggle("", isOn: $soundIsOn)
                           
                            .labelsHidden()
                            .onChange (of: soundIsOn) { _ in
                                if audioPlayer != nil {
                                    if audioPlayer.isPlaying {
                                        audioPlayer.stop()
                                    }
                                }
                                
                            }
                   
                        Spacer()
                        
                        Button("Show Message") {
                            
                            
                            
                            
                            let imgArr = ["You are great!", "You are awesome!", "You are skilled!", "Fabulous? That's you!"]
                            
                            
                            var randomNum = Int.random(in: 0...3)
                            
                            
                            while randomNum == lastMessageNumber {
                                randomNum = Int.random(in: 0...3)
                            }
                            
                            
                            messageString = imgArr[randomNum]
                            lastMessageNumber = randomNum
                            
                            
                            
                            //TODO: update the imageName variable
                            
                            var ranNumImg = Int.random(in: 0...9)
                            
                            while ranNumImg == lastImageNumber {
                                ranNumImg =  Int.random(in: 0...9)
                            }
                            
                            imageString = "image" + String(ranNumImg)
                            lastImageNumber = ranNumImg
                            
                            
                            
                            if soundIsOn {
                                playSound(soundName: "sound\(lastSoundNumber)")
                            }
                            
                            func playSound(soundName: String) {
                                var soundNumber: Int
                                
                                repeat {
                                    soundNumber = Int.random(in: 0...5)
                                    
                                } while lastSoundNumber == soundNumber
                                
                                lastSoundNumber = soundNumber
                                let soundName = "sound\(soundNumber)"
                                
                                
                                guard let soundFile = NSDataAsset(name: soundName) else {
                                    print("😡 Could not read file called \(soundName)")
                                    return
                                }
                                
                                do {
                                    audioPlayer = try AVAudioPlayer(data: soundFile.data)
                                    audioPlayer.play()
                                    
                                } catch {
                                    print("😡 ERROR: \(error.localizedDescription) creating audioPlayer.")
                                }
                            }
                            
                            func nonRepeatingRandom(lastNumber: Int, upperBounds: Int) -> Int {
                                var number: Int
                                
                                repeat {
                                    number = Int.random(in: 0...upperBounds)
                                } while number == lastNumber
                                return number
                            }
                            
                        }
                    }
                    
                }
                .buttonStyle(.borderedProminent)
                .tint(.accentColor)
                
                
                //  }
            
            .padding()
            
            
            
            
            
            
            
        }
    }
    
    
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

