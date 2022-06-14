//
// From SwiftUI by Example by Paul Hudson
// https://www.hackingwithswift.com/quick-start/swiftui
//
// You're welcome to use this code for any purpose,
// commercial or otherwise, with or without attribution.
//

import SwiftUI

struct ContentView: View {
    @State private var isShow: Bool = false
    @State private var hideSearchButton = false
    @State private var createPasscodeForChannel: String = ""
    @State private var channelName: String = ""
    
    @FocusState private var nameIsFocused: Bool
    
    @ObservedObject private var chatConnectionManager = ChatConnectionManager()
    
    var passcode: Passcode = Passcode()
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Host Chat")) {
                    HStack {
                        Text("Name")
                        TextField("Enter your channel name", text: $channelName)
                            .multilineTextAlignment(.trailing)
                            .focused($nameIsFocused)
                    }
                    HStack {
                        Spacer()
                        Button("Create Chat") {
                            if !channelName.isEmpty {
                                // Dismiss the keyboard when the user starts hosting.
                                nameIsFocused = false
                                
                                //createPasscodeForChannel = passcode.generate()
                                
                                chatConnectionManager.host()

                            }
                        }
                        Spacer()
                    }
                }
                if !createPasscodeForChannel.isEmpty {
                    Section(header: Text("Passcode")) {
                        HStack {
                            Spacer()
                            Text(createPasscodeForChannel)
                                .font(.title)
                            Spacer()
                        }
                    }
                }
                Section(header: Text("Join Friends")) {
                        HStack {
                            Spacer()
                            Button(
                              action: {
                                chatConnectionManager.join()
                              }) {
                                  NavigationLink(destination:ChatView()
                                    .environmentObject(chatConnectionManager),
                                  isActive: $chatConnectionManager.connectedToChat) {
                                  Text("Search for friends")
                                  }
                              }
                            Spacer()
                    }
                }
            }
            .navigationTitle("OpenChat")
            .listStyle(.grouped)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
