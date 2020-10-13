//
//  ApiService.swift
//  StarWarsVOne
//
//  Created by Ghassan  albakuaa  on 10/12/20.
//
import Foundation

  //  struct API_URLs {
   //     static let nowPlayingURL = "https://swapi.dev/api/people/?page="
       
   // }
let nowPlayingURL = "https://swapi.dev/api/people/?page="

enum NetworkError: Error {
        case badData
        case badImage
        case decodeFailure
        case badURL
        case err
    }
    typealias MovieHandler = (Result<[Result2], NetworkError>) -> ()
  //  typealias ImageHandler = (Result<UIImage?, NetworkError>) -> ()

    final class NetworkManager {
        
        static let shared = NetworkManager()
        
        let session: URLSession
        let decoder: JSONDecoder
        var result2: Welcome?
       private init(session: URLSession = URLSession.shared , decoder:JSONDecoder = JSONDecoder()) {
                self.session = session
                self.decoder = decoder
            }
        }

    extension NetworkManager {
       // func fetchMovies(completion: @escaping (Result<Movie , Error>)) -> (){
        func fetchMovies(completion: @escaping MovieHandler) -> (){
            guard  let url = URL(string: nowPlayingURL) else {
                completion(.failure(.badURL))
                return
            }
            self.session.dataTask(with: url) {(data , response , error) in
                if let _ = error{
                    completion(.failure(.err))
                }
                guard let data = data else {
                    completion(.failure(.badData))
                    return
                }
                do{
                    let page = try self.decoder.decode(Welcome.self, from: data)
                    self.result2 = page
                    completion(.success(page.results))
                }catch {
                    completion(.failure(.decodeFailure))
                }
                
            }.resume()
            
        }
  /*
        func fetchImage(imagePath: String, completion: @escaping ImageHandler) {
            
            let fullPath = API_URLs.imageBaseURL + imagePath
            guard let url = URL(string: fullPath) else {
                completion(.failure(.badURL))
                return
            }
            self.session.dataTask(with: url) { (data, response, error) in
                if let _ = error {
                    completion(.failure(.err))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(.badData))
                    return
                }
                
                guard let image = UIImage(data: data) else {
                    completion(.failure(.badImage))
                    return
                }
                
                completion(.success(image))
                return
            }.resume()
            
        }
       */
    }



