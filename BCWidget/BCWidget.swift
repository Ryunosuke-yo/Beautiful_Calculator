//
//  BCWidget.swift
//  BCWidget
//
//  Created by Ryunosuke Yokokawa on 2023-04-03.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct BCWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
                ZStack {
                 AccessoryWidgetBackground()
                        .cornerRadius(20)
                    Image(systemName: "plus.forwardslash.minus")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 30, height: 30)
                        
                 }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
              
            }
    
}

struct BCWidget: Widget {
    let kind: String = "BCWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            BCWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.accessoryCircular])
    }
}

struct BCWidget_Previews: PreviewProvider {
    static var previews: some View {
        BCWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .accessoryCircular))
    }
}
