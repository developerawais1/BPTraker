// bpwidgets.swift
// BP Tracker
// Created by user on 6/12/24.
import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> widegets_ui {
        widegets_ui(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (widegets_ui) -> ()) {
        let entry = widegets_ui(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [widegets_ui] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = widegets_ui(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct widegets_ui: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct bpwidgetsEntryView: View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Image("Record Blood Pressure")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .padding(.bottom, -20)
            
            Text(entry.date, style: .time)
                .padding(.top, -500)
        }
        .onAppear {
            addWidgetToHomeScreen()
        }
    }

    func addWidgetToHomeScreen() {
        let userDefaults = UserDefaults(suiteName: "group.com.BP_Tracker.widgets")
        if let configuration = userDefaults?.string(forKey: "SelectedWidget") {
            WidgetCenter.shared.reloadAllTimelines()
            print("Widget with configuration \(configuration) added to home screen.")
        }
    }
}

struct bpwidgets: Widget {
    let kind: String = "bpwidgets"
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            bpwidgetsEntryView(entry: entry)
        }
        .configurationDisplayName("BP Tracker Widget")
        .description("This is a widget for tracking blood pressure and heart rate.")
    }
}

struct bpwidgets_Previews: PreviewProvider {
    static var previews: some View {
        bpwidgetsEntryView(entry: widegets_ui(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
