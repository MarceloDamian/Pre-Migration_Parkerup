//
//  ContentView.swift
//  parky
//
//  Created by Erick Cabrera on 3/20/24.
// You can use /// to comment multiople things and just hit enter.





// Change first letter in textbox to be lowercase unless they press uppercase.





import SwiftUI


struct mainpge: View
{
//    @State var get: String = ContentView().insertapi
//    Text("You are logged in \(get)")

    @State var goToView2: Bool = false
    @State var path = NavigationPath()
    
    var body: some View
    {
        NavigationStack(path:$path)
        {
            VStack 
            {
                Text ("Hello this is the main page")
                Text ("Pick your Car:  (insert api of cars)")
                

            }
        }
    }
    
}


struct signuppge: View
{
    @State var path2 = NavigationPath()
    @State private var NewUsr: String = ""
    @State private var NewEmail: String = ""
    @State private var NewPass: String = ""
    @State private var ConfirmPass: String = ""

    
    @State private var NewMem: Bool = false
    
    @State private var Cond: Bool = false

    // check email if it isnt in the database already
    // check username if it isnt in the database already

    
    
//    @State var usr: String = "" // figure out how to pass parameters and sned it through


    var body: some View
    {
        NavigationStack(path:$path2)
        {
            ZStack
            {
                Color.blue.ignoresSafeArea()
                Rectangle().scale(1.0).foregroundColor(.white)
                
                VStack
                {
                    Text("Sign Up!").font(.largeTitle).bold().padding().position(x:200,y:50)

                    
                    TextField("Email", text: $NewEmail)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10) //rounds box
                        .border(.red, width: CGFloat())
                        .position(x:200,y:0)

                    TextField("Username", text: $NewUsr)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10) //rounds box
                        .border(.red, width: CGFloat())
                        .position(x:200,y:-20)

                    SecureField("Password", text: $NewPass) // securefield hides text
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat())
                        .position(x:200,y:-40)

                    SecureField("Confirm Password", text: $ConfirmPass) // securefield hides text
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat())
                        .position(x:200,y:-60)
                    

                        Button("Welcome \(NewUsr)")
                        {
                            if NewPass == ConfirmPass && (NewPass.count != 0) && (ConfirmPass.count != 0)
                                {
                                    NewMem=true
                                }
                        }
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .position(x:200,y:-40)

                }.navigationDestination(isPresented:$NewMem){mainpge(path:path2)}
            }
        }
    }

    
    
    
    
    
    
}






struct ContentView: View 
{
    // With @State, you tell SwiftUI that a view is now dependent on some state. If the state changes, so should the User Interface. It's a core principle of SwiftUI: data drives the UI.
    // View is now dependent on some state
    
    @State private var username: String = "" // removed the private in order to access on the other page.
    @State private var password: String = ""
    
    @State private var wrongUsername: Float = 0
    @State private var wrongPassword: Float  = 0
    
    @State private var showingLoginScreen: Bool = false
    
    @State var path = NavigationPath()
    
    @State var insertapi:String = "erick"
    
    
    
    @State private var NewMember: Bool = false


    

    
    var body: some View
    {
        NavigationStack (path:$path)
        {
            ZStack
            {
                Color.blue.ignoresSafeArea()
                Rectangle().scale(1.0).foregroundColor(.white)

                VStack 
                {
                    Text("Login").font(.largeTitle).bold().padding().offset(y: -230)
                    
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10) //rounds box
                        .border(.red, width: CGFloat(wrongUsername))
                        .offset(y:-200)
                        .textCase(.lowercase) // ? Neccessary???
                        
                    
                    SecureField("Password", text: $password) // securefield hides text
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                        .offset(y:-195)
                        
                    
                    Button("Login") 
                    {functoauthenticateUser(username: username,password: password)}
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .offset(y:-175)
                    
                    Button("New Here ? Sign Up")
                    {NewMember=true}
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.mint)
                        .cornerRadius(10)
                        .offset(y:-160)
                        

                }.navigationDestination(isPresented: $showingLoginScreen){mainpge(path: path)}
                 .navigationDestination(isPresented: $NewMember){signuppge(path2: path)}
            }.navigationBarHidden(true)

        }
    
    }
    
    func functoauthenticateUser(username: String, password: String)
    {

        if username.lowercased() == insertapi
        {
            wrongUsername = 0
            
            if password.lowercased() == "erick123"
            {
                wrongPassword = 0
                showingLoginScreen = true
                
                
            }
            else
            {
                wrongPassword = 1 // changed to 1 from 2
            }
        } 
        else
        {
            wrongUsername = 1 // changed to 1 from 2
        }
    }
}





struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
        mainpge()
        signuppge()
    }
}









//            Text ("Hello world").navigationTitle("Navigation")  //Makes title
//            Text ("World ") // Makes text in the center of another page
//            NavigationLink(destination: Text(" Hello World. (Next page)"))
//            {
//                Text("Link press me!") // "a link that is pressed with this title
//            }







//import SwiftUI
//import CoreData
//
//
//struct ContentView: View 
//{
//    
//    @Environment(\.managedObjectContext) private var viewContext // Essentially opens the package enviornement and file managedobjectcontext and uses the variable viewcontext
//
//    @FetchRequest(sortDescriptors:[NSSortDescriptor(keyPath:\Item.timestamp,ascending:true)],
//        animation: .default)
//    
//    private var items: FetchedResults<Item>
//
//    var body: some View 
//    {
//        NavigationView 
//        {
//            List
//            {
//                
//                ForEach(items) 
//                { item in
//                    NavigationLink
//                    {
//                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//                    } label: 
//                        {
//                            Text(item.timestamp!, formatter: itemFormatter)
//                        }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            
//            .toolbar
//            {
//                ToolbarItem(placement: .navigationBarTrailing) 
//                {
//                    EditButton()
//                }
//                ToolbarItem 
//                {
//                    Button(action: addItem) 
//                    {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//            
//            Text("Select an item")
//        }
//    }
//
//    private func addItem() 
//    {
//        withAnimation 
//        {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do
//            {
//                try viewContext.save()
//            } 
//            catch
//            {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) 
//    {
//        withAnimation 
//        {
//            offsets.map 
//            { items[$0] }.forEach(viewContext.delete)
//
//            do 
//            {
//                try viewContext.save()
//            } 
//            catch
//            {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//}
//
//
//
//
//
//private let itemFormatter: DateFormatter = 
//{
//    let formatter = DateFormatter()
//    formatter.timeStyle = .medium
//    return formatter
//}()
//
//
//
//#Preview  // Allows you to view in iphone 15 pro
//{
//    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//}
