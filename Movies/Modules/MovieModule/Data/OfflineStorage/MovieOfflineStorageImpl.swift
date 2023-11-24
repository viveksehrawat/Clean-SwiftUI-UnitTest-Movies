//
//  MovieOfflineStorageImpl.swift
//  Movies
//
//  Created by Vivek Sehrawat on 24/11/23.
//

import Foundation
import CoreData

class MovieOfflineStorageImpl: IMovieOfflineStorage{
   
    let persistentContainer: NSPersistentContainer
        
    init(persistentContainer: NSPersistentContainer) {
        self.persistentContainer = persistentContainer
    }
    
    func getMoviesFromStorage() async throws -> [MovieDataListDTO] {
        let request: NSFetchRequest<IMovie> = IMovie.fetchRequest()
        let context = persistentContainer.viewContext
        
        do{
            let moviesEntities = try context.fetch(request)
            let movies = moviesEntities.map { movie in
                return  MovieDataListDTO(id: Int(movie.movieId), title: movie.title ?? "", overview: movie.overview ?? "", poster_path: movie.imageUrl ?? "", release_date: movie.releaseDate ?? "")
            }
            return movies
        }catch{
            throw error
        }

    }
    
    func save(movies: [MovieDataListDTO]) {
        let context = persistentContainer.newBackgroundContext()
        context.performAndWait {
            do{
                let request: NSFetchRequest<IMovie> = IMovie.fetchRequest()
                let existingMovieEntities = try context.fetch(request)
                let existingMoviIds = existingMovieEntities.compactMap { Int($0.movieId) }

                movies.forEach { movieDto in
                    if !existingMoviIds.contains(movieDto.id){
                        let movie = IMovie(context: context)
                        movie.movieId = Int16(truncatingIfNeeded: movieDto.id)
                        movie.title = movieDto.title
                        movie.overview = movieDto.overview
                        movie.imageUrl = movieDto.poster_path
                        movie.releaseDate = movieDto.release_date
                    }
                }
                try context.save()
            } catch {
                print("Failed to save  ", error)
            }
        }
    }
}
