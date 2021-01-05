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
    
    func placeholder(in context: Context) -> SimpleEntry {
        return SimpleEntry(data: StatusData.demo)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        let entry = SimpleEntry(data: StatusData.demo)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> Void) {
        
        let url = URL(string: "https://bing.ioliu.cn/v1/rand")!
        
        let session = URLSession.shared.dataTask(with: url) { (data, _, _) in
            let widgeData = StatusData.evDemo
            widgeData.imageData = data!
            
            // 60 分钟刷新一次
            let currentDate = Date()
            let refreshDate = Calendar.current.date(byAdding: .minute, value: 60, to: currentDate)!
            
            let entries: [SimpleEntry] = [SimpleEntry(data: widgeData)]
            
            let timeline = Timeline(entries: entries, policy: .after(refreshDate))
            completion(timeline)
        }
        
        session.resume()
    }
    
    public typealias Entry = SimpleEntry
}

struct SimpleEntry: TimelineEntry {
    let date = Date()
    
    public let data: StatusData
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
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
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
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            StatusWidgeEntryView(entry: entry)
        }
        .supportedFamilies([.systemMedium])
        .configurationDisplayName("Status Widget")
        .description("This is an example widget.")
    }
}

struct BingImageWidgeEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        BingImageView().environmentObject(entry.data)
    }
}

struct BingImageWidge: Widget {
    private let kind: String = "BingImageWidge"

    public var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            BingImageWidgeEntryView(entry: entry)
        }
        .supportedFamilies([.systemMedium])
        .configurationDisplayName("Bing Image Widget")
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
        BingImageWidge()
        EVWidget()
        StatusWidge()
    }
}
