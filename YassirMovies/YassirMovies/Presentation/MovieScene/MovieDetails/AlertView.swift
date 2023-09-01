//
//  AlertView.swift
//  YassirMovies
//
//  Created by Mohamed El Gedawy on 01/09/2023.
//

import SwiftUI

struct AlertView: View {
    @State var showingAlert = false
    var message: String
    
    var body: some View {
        Spacer()
        .alert(message, isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(message: "HelloWorld")
    }
}
