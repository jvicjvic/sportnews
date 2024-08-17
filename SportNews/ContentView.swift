import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            // Articles
            ArticlesTabView()
            .tabItem {
                Label("Articles", systemImage: "list.bullet")
            }

            // Leagues
            LeaguesTabView()
            .tabItem {
                Label("Leagues", systemImage: "trophy.circle")
            }

            // Teams
            TeamsTabView()
            .tabItem {
                Label("Teams", systemImage: "soccerball.inverse")
            }

            // Authors
            AuthorsTabView()
            .tabItem {
                Label("Authors", systemImage: "person.badge.shield.checkmark")
            }
        }
    }
}

#Preview {
    ContentView()
}
