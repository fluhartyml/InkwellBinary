//
//  ContentView.swift
//  InkwellBinary
//
//  Created by Michael Fluharty on 10/2/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    @State private var selectedItem: Item.ID?
    @State private var selectedText: String = ""

    var body: some View {
        NavigationSplitView {
            List(items, selection: $selectedItem) { item in
                NavigationLink(value: item.id) {
                    Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            // This demo TextEditor uses a temporary @State variable and does not persist text.
            // For persistent editing, bind to a property on Item and save changes.
            // Wrapping the TextEditor in a ZStack with a subtle border and a placeholder behind the editor
            // helps users discover the editor interface.
            // Remove this placeholder logic when binding to actual content.
            ZStack(alignment: .topLeading) {
                if selectedText.isEmpty {
                    Text("Tap to edit...")
                        .foregroundColor(.secondary)
                        .padding(EdgeInsets(top: 8, leading: 5, bottom: 0, trailing: 0))
                }
                TextEditor(text: $selectedText)
                    .background(Color(.secondarySystemBackground))
            }
            .border(Color.secondary, width: 1)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
