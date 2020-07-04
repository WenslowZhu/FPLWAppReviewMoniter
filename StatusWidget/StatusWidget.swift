//
//  StatusWidget.swift
//  StatusWidget
//
//  Created by 朱廷 on 2020/7/4.
//  Copyright © 2020 Wenslow. All rights reserved.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    public typealias Entry = SimpleEntry

    // 放置预览数据
    public func snapshot(with context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(data: StatusData.demo)
        completion(entry)
        
    }

    public func timeline(with context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            // 5 分钟刷新一次
            let currentDate = Date()
            let refreshDate = Calendar.current.date(byAdding: .minute, value: 5, to: currentDate)!
            
            let entries: [SimpleEntry] = [SimpleEntry(data: StatusData.evDemo)]
            
            let timeline = Timeline(entries: entries, policy: .after(refreshDate))
            completion(timeline)
        }
        
    }
}

struct SimpleEntry: TimelineEntry {
    let date = Date()
    
    public let data: StatusData
}

struct PlaceholderView : View {
    var body: some View {
//        ContentView().environmentObject(StatusData.demo)
        Text("Placeholder")
    }
}

struct EVWidgetEntryView : View {
    
    var entry: Provider.Entry

    var body: some View {
        ContentView().environmentObject(entry.data)
            .widgetURL(URL(string: "aaa"))
    }
}

struct EVWidget: Widget {
    private let kind: String = "EVWidget"

    public var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider(), placeholder: PlaceholderView()) { entry in
            EVWidgetEntryView(entry: entry)
        }
        .supportedFamilies([.systemSmall])
        .configurationDisplayName("EV Widget")
        .description("This is an example widget.")
    }
}

struct StatusWidgeEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        StatusView().environmentObject(entry.data)
    }
}

struct StatusWidge: Widget {
    private let kind: String = "StatusWidge"

    public var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider(), placeholder: PlaceholderView()) { entry in
            StatusWidgeEntryView(entry: entry)
        }
        .supportedFamilies([.systemMedium])
        .configurationDisplayName("Status Widget")
        .description("This is an example widget.")
    }
}


struct EVWidget_Previews: PreviewProvider {
    static var previews: some View {
        EVWidgetEntryView(entry: SimpleEntry(data: StatusData.evDemo))
    }
}

@main
struct SwiftWidgetsBundle: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        EVWidget()
        StatusWidge()
    }
}
