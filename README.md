# 🎬 MovieApp

A modern iOS application for browsing and viewing movie details, built with **SwiftUI** and **Combine** for reactive programming.  
The app is fully declarative, reactive, and lightweight.

---

## 🚀 Technologies Used
- **Swift 5.10+** – Modern, type-safe programming language  
- **iOS 16+** – Minimum deployment target  
- **SwiftUI** – Declarative UI framework  
- **Combine** – Native reactive programming for state management  
- **Alamofire** – Networking layer for API requests  
- **Dependency Injection** – Decoupled, testable components  

---

## 🏗️ Architecture
The app follows **Clean MVVM** principles to ensure modularity, testability, and maintainability:

### Domain Layer
- **Entities**: Core business models (`MovieDetailsDataModel`) representing pure data.  
- **Use Cases**: Business logic encapsulation (e.g., `MovieListUseCase`) for reusable application logic.  

### Data Layer
- **Repository**: Implements `HomeRepository` to coordinate data from remote sources.
- **Entities**: Implements `LocalModels` to used in Modules.  
- **Interfaces**:  
  - `HomeRepositoryProtocol`: Handles **TMDb API** requests.  

### Presentation Layer
- **ViewModels**: `MoviesListViewModel`, `MovieDetailsViewModel` manage state, side effects, and bindings.  
- **Views**: `MoviesView`, `MovieDetailsView` built with SwiftUI and observing ViewModel publishers.  

---

## 🔄 UI State Management
Each `ViewModel` exposes a single:  

```swift
@Published var viewState: ViewState

enum ViewState {
    case content
    case showMessage(String)
    case error(String)
    case loading
}

SwiftUI Views Behavior
.loading: Shows a ProgressView loader
.content: Displays the current screen (movies list or details)
.showMessage: Presents a user-friendly message (e.g., toast/banner)
.error: Shows error state with retry support

```
  ## 📌 Next Sprint Plan
### Upcoming Features

- **Internet Connection Lost Handling**  
  - Show a dedicated banner or overlay when the network is unavailable.  
  - Allow users to retry once the connection is restored.  

- **Empty View Handling**  
  - Present a clear empty state when no data is available.  
  - Use a friendly, informative design to communicate the lack of content.  

- **Pull-to-Refresh**  
  - Integrate native SwiftUI `refreshable` support.  
  - Enable users to manually reload movie data.  

