//
//  bpwidgetsLiveActivity.swift
//  bpwidgets
//
//  Created by user on 6/12/24.
//

import WidgetKit
import SwiftUI

struct bpwidgetsLiveActivity: Widget {
    let kind: String = "bpwidgetsLiveActivity"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: SimpleProvider()) { entry in
            Text("Live Activity")
        }
        .configurationDisplayName("Live Activity")
        .description("This is a live activity for BP Tracker.")
    }
}

struct SimpleProvider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let timeline = Timeline(entries: [SimpleEntry(date: Date())], policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct SimpleEntryView: View {
    var entry: SimpleProvider.Entry

    var body: some View {
        Text(entry.date, style: .time)
    }
}

struct bpwidgetsLiveActivity_Previews: PreviewProvider {
    static var previews: some View {
        SimpleEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
