//  Created by musesum on 12/4/22.

import SwiftUI

struct PeersView: View {
    @ObservedObject var peersVm: PeersVm
    var peersTitle: String { peersVm.peersTitle }
    var peersList: String { peersVm.peersList }
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "globe")
                    .imageScale(.medium)
                    .foregroundColor(.white)
                Text(peersTitle)
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 1.0)
            }
            Text(peersList)
                .foregroundColor(.white)
                .shadow(color: .black, radius: 1.0)
        }
        .padding()
    }
}
