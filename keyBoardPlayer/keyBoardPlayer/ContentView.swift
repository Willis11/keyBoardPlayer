//
//  ContentView.swift
//  keyBoardPlayer
//
//  Created by Jude Willis on 25/07/2020.
//  Copyright © 2020 Jude Willis. All rights reserved.
//

import SwiftUI
import AVFoundation
var audioPlayer : AVAudioPlayer?

let arrayOfSounds = ["allen_arrogh", "erased", "no_sh", "why_not", "shrek_tic_tacs", "mother_get", "mother_talk", "hello_cutie", "how_ya_doin_x", "be_cool", "deep_trouble", "apple_1984_prevail", "att", "bat-time_x", "bud_how_ya_doin", "bugs_adios", "bugs_ask", "bugs_here_i_come", "erased", "fedex2", "got_s1e1_wake_dragon", "great", "green_giant", "hawaiian_punch", "image", "intel", "love_this_place", "mean_one", "meet_the_joker", "riddler_laugh", "tomorrow", "allen_arrogh", "erased", "no_sh", "why_not", "shrek_tic_tacs", "mother_get", "mother_talk", "hello_cutie", "how_ya_doin_x", "be_cool", "deep_trouble", "apple_1984_prevail", "att", "bat-time_x", "bud_how_ya_doin", "bugs_adios", "bugs_ask", "bugs_here_i_come", "erased", "fedex2", "got_s1e1_wake_dragon", "great", "green_giant", "hawaiian_punch", "image", "intel", "love_this_place", "mean_one", "meet_the_joker", "riddler_laugh", "tomorrow", "allen_arrogh", "erased", "no_sh", "why_not", "shrek_tic_tacs", "mother_get", "mother_talk", "hello_cutie", "how_ya_doin_x", "be_cool", "deep_trouble", "apple_1984_prevail", "att", "bat-time_x", "bud_how_ya_doin", "bugs_adios", "bugs_ask", "bugs_here_i_come", "erased", "fedex2", "got_s1e1_wake_dragon", "great", "green_giant", "hawaiian_punch", "image", "intel", "love_this_place", "mean_one", "meet_the_joker", "riddler_laugh", "tomorrow", "allen_arrogh", "erased", "no_sh", "why_not", "shrek_tic_tacs", "mother_get", "mother_talk", "hello_cutie", "how_ya_doin_x", "be_cool", "deep_trouble", "apple_1984_prevail", "att", "bat-time_x", "bud_how_ya_doin", "bugs_adios", "bugs_ask", "bugs_here_i_come", "erased", "fedex2", "got_s1e1_wake_dragon", "great", "green_giant", "hawaiian_punch", "image", "intel", "love_this_place", "mean_one", "meet_the_joker", "riddler_laugh", "tomorrow"]

struct KeyEventHandling: NSViewRepresentable {
    class KeyView: NSView {
        
        override var acceptsFirstResponder: Bool { true }
        override func keyDown(with event: NSEvent) {
            super.keyDown(with: event)
            print(">> key \(event.charactersIgnoringModifiers ?? "")")
            let keyChosen = event.keyCode
            print(keyChosen)
        
            guard let pathToSound = Bundle.main.path(forResource: arrayOfSounds[Int(keyChosen)], ofType:"wav") else { return print("no worky") }
            let url = URL(fileURLWithPath: pathToSound)
            
            do{
                print("trying audio")
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            }
            catch{
                print("could not play")
            }
           
        }
    }

   func makeNSView(context: Context) -> NSView {
        let view = KeyView()
        DispatchQueue.main.async { // wait till next event cycle
            view.window?.makeFirstResponder(view)
        }
        return view
    }
  
    func updateNSView(_ nsView: NSView, context: Context) {
    }
}

struct ContentView: View {
    var body: some View {
        ZStack{
            Text("Press the Keys")
                .font(.largeTitle)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(KeyEventHandling())
            
        }
        .background(Color.purple)
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
