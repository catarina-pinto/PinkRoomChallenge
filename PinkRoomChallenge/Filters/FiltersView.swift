//
//  FiltersView.swift
//  PinkRoomChallenge
//
//  Created by Catarina Pinto on 12/03/2024.
//

import SwiftUI


struct FiltersView: View {
    @ObservedObject var filtersViewModel: FiltersViewModel
    
    init(presentFilters: Binding<Bool>, selectedFilter: Binding<Int>, starsAscending: Binding<Bool>, availableLanguages: Binding<[Item]>, availableTopics: Binding<[Item]>) {
        self.filtersViewModel = FiltersViewModel(presentFilters: presentFilters, selectedFilter: selectedFilter, starsAscending: starsAscending, availableLanguages: availableLanguages, availableTopics: availableTopics)
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .trailing, spacing: 0) {
                ForEach(FiltersRowType.allCases, id: \.self){ row in
                    RowView(selectedFilter: row.rawValue, isSelected: filtersViewModel.selectedFilter.wrappedValue == row.rawValue, imageName: row.iconName, title: row.title) {
                        filtersViewModel.selectedFilter.wrappedValue = (filtersViewModel.selectedFilter.wrappedValue == row.rawValue) ? -1 : row.rawValue
                    }
                }
                Spacer()
            }
            .padding(.top, 100)
            .frame(width: 270)
            .background(
                Color.white
            )
            
            Spacer()
        }
        .background(.clear)
    }
    
    
    
    func RowView(selectedFilter: Int, isSelected: Bool, imageName: String, title: String, hideDivider: Bool = false, action: @escaping (()->())) -> some View{
        VStack {
            Button{
                action()
            } label: {
                VStack(alignment: .trailing){
                    HStack(spacing: 20){
                        Rectangle()
                            .fill(isSelected ? Color("PinkRoomPink") : .white)
                            .frame(width: 5)
                        
                        ZStack{
                            Image(imageName)
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(isSelected ? .black : .gray)
                                .frame(width: 26, height: 26)
                        }
                        .frame(width: 30, height: 30)
                        Text(title)
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(isSelected ? .black : .gray)
                        Spacer()
                        
                        Image(systemName: isSelected ? "chevron.down" : "chevron.right")
                            .foregroundColor(.black)
                            .padding(.trailing, 25)
                        
                    }
                }
                .frame(height: 50)
                .background(
                    LinearGradient(colors: [isSelected ? Color("PinkRoomPink")
                        .opacity(0.5) : .white, .white], startPoint: .trailing, endPoint: .leading)
                )
            }
            
            if isSelected {
                ScrollView {
                    RowItemOptionsView(selected: selectedFilter)
                }
            }
        }
    }
    
    func RowItemOptionsView(selected: Int) -> some View{
        VStack {
            if (selected == 2) {
                Toggle("Ascending order", isOn: filtersViewModel.starsAscending)
                    .foregroundColor(.black)
            } else {
                let list = selected == 1 ? filtersViewModel.availableTopics : filtersViewModel.availableLanguages
                ForEach(0..<list.count, id: \.self) { index in
                    Toggle(list[index].name.wrappedValue, isOn: list[index].isSelected)
                }
            }
        }
        .padding(.leading, 40)
        .padding(.trailing, 20)
    }
}



struct FiltersView_Previews: PreviewProvider {
    static var previews: some View {
        FiltersView(presentFilters: .constant(true), selectedFilter: .constant(1), starsAscending: .constant(false), availableLanguages: .constant([Item(id: UUID(), name: "Java", isSelected: false)]), availableTopics: .constant([Item(id: UUID(), name: "Tetris", isSelected: false)]))
    }
}
