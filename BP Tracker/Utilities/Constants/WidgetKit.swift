
//
//  WidgetKit.swift
//  BP Tracker
//
//  Created by user on 6/8/24.
//
import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: "RecordBP")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        let entry = SimpleEntry(date: Date(), configuration: loadConfiguration())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> Void) {
        var entries: [SimpleEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: loadConfiguration())
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }

    private func loadConfiguration() -> String {
        let userDefaults = UserDefaults(suiteName: "group.com.BPTracker.widgets")
        return userDefaults?.string(forKey: "SelectedWidget") ?? "RecordBP"
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: String
}

struct MyWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            switch entry.configuration {
            case "RecordBP":
                Text("Record Blood Pressure")
            case "RecordHR":
                Text("Record Heart Rate")
            case "ViewHistory":
                Text("View History")
            default:
                Text("Unknown Widget")
            }
        }
    }
}

struct MyWidget: Widget {
    let kind: String = "MyWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            MyWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct MyWidgetBundle: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        MyWidget()
    }
}
