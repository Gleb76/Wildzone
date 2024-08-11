//
// KinopoiskAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class KinopoiskAPI {
    static private var apiKeys = ["1JY71X8-2YS4676-PCAGFW2-AWK9YP8", "V5SHYKM-27G4090-N6G8NBD-KCNJZH1", "G34DN47-Q5YMY18-NHGEQDX-20VTZAW"]
    static private var currentApiKeyIndex = 0
}

// MARK: - Public Methods
extension KinopoiskAPI {
    
    //MARK: - PossibleValues
    /**
     Этот метод принимает только определенные поля, и возвращает по ним все доступные значения.
     
     - Parameters:
     - field: Поле, для которого нужно получить возможные значения (например, "genres.name", "countries.name", "type", "typeNumber", "status").
     - apiResponseQueue: Очередь обработки ответа. Очередь DispatchQueue, в которой будет выполняться обработка ответа (по умолчанию OpenAPIClientAPI.apiResponseQueue).
     - completion: Замыкание завершения. Замыкание, которое вызывается при завершении запроса. Содержит данные ответа PossibleValuesResponse или ошибку.
     
     - Returns: RequestTask. Объект задачи запроса.
     */
    @discardableResult
    public class func getPossibleValuesByField(
        field: String,
        apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue,
        completion: @escaping ((_ data: [PossibleValueModel]?, _ error: Error?) -> Void)
    ) -> RequestTask {
        func executeRequest() -> RequestTask {
            return possibleValuesGetWithRequestBuilder(field: field).execute(apiResponseQueue) { result in
                switch result {
                case let .success(response):
                    completion(response.body, nil)
                case let .failure(error):
                    if let response = error as? HTTPURLResponse, response.statusCode == 401 {
                        nextApiKey()
                        print("Текущий ключ оказался невалидным, попробуем следующий: \(getCurrentApiKey())")
                        print(error)
                        _ = executeRequest()
                    } else {
                        print(error)
                        completion(nil, error)
                    }
                }
            }
        }
        return executeRequest()
    }
    
    //MARK: - SearchFilmsByTitle
    /**
     Этот метод вернет список фильмов которые подходят под ваш запрос.
     
     - Parameters:
     - query: **Поисковый запрос**. Поисковый запрос для поиска фильмов.
     - page: **Страница выборки**. Номер страницы результатов, начиная с 1 (по умолчанию 1).
     - limit: **Количество элементов на странице**. Количество результатов на страницу (по умолчанию 10).
     - apiResponseQueue: **Очередь обработки ответа**. Очередь DispatchQueue, в которой будет выполняться обработка ответа (по умолчанию OpenAPIClientAPI.apiResponseQueue).
     - completion: **Замыкание завершения**. Замыкание, которое вызывается при завершении запроса. Содержит данные ответа MovieResponseModel или ошибку.
     
     - Returns: **RequestTask**. Объект задачи запроса.
     */
    @discardableResult
    public class func searchFilmsGet(
        query: String,
        page: Int = 1,
        limit: Int = 10,
        apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue,
        completion: @escaping ((_ data: MovieResponseModel?, _ error: Error?) -> Void)
    ) -> RequestTask {
        func executeRequest() -> RequestTask {
            return searchFilmsGetWithRequestBuilder(
                query: query,
                page: page,
                limit: limit
            ).execute(apiResponseQueue) { result in
                switch result {
                case let .success(response):
                    completion(response.body, nil)
                case let .failure(error):
                    if let response = error as? HTTPURLResponse, response.statusCode == 401 {
                        nextApiKey()
                        print("Текущий ключ оказался невалидным, попробуем следующий: \(getCurrentApiKey())")
                        print(error)
                        _ = executeRequest()
                    } else {
                        print(error)
                        completion(nil, error)
                    }
                }
            }
        }
        return executeRequest()
    }
    
    //MARK: - DownloadPosters
    /**
     Этот метод предназначен для поиска картинок которые привязаны к фильмам и сериалам
     
     - Parameters:
     - movieId: **Идентификатор фильма**. Уникальный идентификатор фильма для получения постеров.
     - type: **Тип постера**. Поиск картинок по типу (пример: "cover", "!cover").
     - language: **Язык**. Поиск картинок по языку (пример: "en", "!de").
     - height: **Высота постера**. Поиск картинок по высоте (пример: "1920", "360-1920").
     - width: **Ширина постера**. Поиск картинок по ширине (пример: "1080", "320-1080").
     - updatedAt: **Дата обновления**. Поиск по дате обновления в базе (пример: 01.01.2020, 01.01.2020-31.12.2020).
     - createdAt: **Дата создания**. Поиск по дате добавления в базу (пример: 01.01.2020, 01.01.2020-31.12.2020).
     - page: **Номер страницы**. Номер страницы результатов, начиная с 1.
     - limit: **Лимит результатов**. Количество результатов на страницу.
     - apiResponseQueue: **Очередь обработки ответа**. Очередь DispatchQueue, в которой будет выполняться обработка ответа (по умолчанию OpenAPIClientAPI.apiResponseQueue).
     - completion: **Замыкание завершения**. Замыкание, которое вызывается при завершении запроса. Содержит данные ответа MovieResponseModel или ошибку.
     
     - Returns: **RequestTask**. Объект задачи запроса.
     */
    @discardableResult
    public class func postersGet(
        movieId: [String],
        type: [String],
        language: [String],
        height: [String],
        width: [String],
        updatedAt: [String],
        createdAt: [String],
        page: Int = 1,
        limit: Int = 10,
        apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue,
        completion: @escaping ((_ data: MovieResponseModel?, _ error: Error?) -> Void)
    ) -> RequestTask {
        
        func executeRequest() -> RequestTask {
            return posterGetWithRequestBuilder(
                movieId: movieId,
                type: type,
                language: language,
                height: height,
                width: width,
                updatedAt: updatedAt,
                createdAt: createdAt,
                page: page,
                limit: limit
            ).execute(apiResponseQueue) { result in
                switch result {
                case let .success(response):
                    completion(response.body, nil)
                case let .failure(error):
                    if let response = error as? HTTPURLResponse, response.statusCode == 401 {
                        nextApiKey()
                        print("Текущий ключ оказался невалидным, попробуем следующий: \(getCurrentApiKey())")
                        print(error)
                        _ = executeRequest()
                    } else {
                        print(error)
                        completion(nil, error)
                    }
                }
            }
        }
        return executeRequest()
    }
}

//MARK: - Private Methods
private extension KinopoiskAPI {
    static func getCurrentApiKey() -> String {
        return apiKeys[currentApiKeyIndex]
    }
    
    static func nextApiKey() {
        currentApiKeyIndex = (currentApiKeyIndex + 1) % apiKeys.count
    }
    
    //MARK: - Private PossibleValues
    class func possibleValuesGetWithRequestBuilder(field: String) -> RequestBuilder<[PossibleValueModel]> {
        let localVariablePath = "/v1/movie/possible-values-by-field"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        
        var urlComponents = URLComponents(string: localVariableURLString)
        urlComponents?.queryItems = [
            URLQueryItem(name: "field", value: field)
        ]
        
        let apiKey = getCurrentApiKey()
        
        let localVariableNillableHeaders: [String: Any?] = [
            "X-API-KEY": apiKey,
            "Content-Type": "application/json"
        ]
        
        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)
        
        let localVariableRequestBuilder: RequestBuilder<[PossibleValueModel]>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()
        
        return localVariableRequestBuilder.init(
            method: "GET",
            URLString: (urlComponents?.string ?? localVariableURLString),
            parameters: nil,
            headers: localVariableHeaderParameters,
            requiresAuthentication: true
        )
    }
    
    //MARK: - Private SearchFilmsByTitle
    class func searchFilmsGetWithRequestBuilder(query: String, page: Int, limit: Int) -> RequestBuilder<MovieResponseModel> {
        let localVariablePath = "/v1.4/movie/search"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        
        var urlComponents = URLComponents(string: localVariableURLString)
        urlComponents?.queryItems = [
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "page", value: String(page)),
            URLQueryItem(name: "limit", value: String(limit))
        ]
        
        let apiKey = getCurrentApiKey()
        
        let localVariableNillableHeaders: [String: Any?] = [
            "X-API-KEY": apiKey,
            "Content-Type": "application/json"
        ]
        
        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)
        
        let localVariableRequestBuilder: RequestBuilder<MovieResponseModel>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()
        
        return localVariableRequestBuilder.init(
            method: "GET",
            URLString: (urlComponents?.string ?? localVariableURLString),
            parameters: nil,
            headers: localVariableHeaderParameters,
            requiresAuthentication: true
        )
    }
    //MARK: - Private DownloadPosters
    class func posterGetWithRequestBuilder(
        movieId: [String],
        type: [String],
        language: [String],
        height: [String],
        width: [String],
        updatedAt: [String],
        createdAt: [String],
        page: Int,
        limit: Int
    ) -> RequestBuilder<MovieResponseModel> {
        
        let localVariablePath = "/v1.4/image"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        
        var urlComponents = URLComponents(string: localVariableURLString)
        urlComponents?.queryItems = [
            URLQueryItem(name: "movieId", value: movieId.joined(separator: ",")),
            URLQueryItem(name: "type", value: type.joined(separator: ",")),
            URLQueryItem(name: "language", value: language.joined(separator: ",")),
            URLQueryItem(name: "height", value: height.joined(separator: ",")),
            URLQueryItem(name: "width", value: width.joined(separator: ",")),
            URLQueryItem(name: "updatedAt", value: updatedAt.joined(separator: ",")),
            URLQueryItem(name: "createdAt", value: createdAt.joined(separator: ",")),
            URLQueryItem(name: "page", value: String(page)),
            URLQueryItem(name: "limit", value: String(limit))
        ]
        
        let apiKey = getCurrentApiKey()
        
        let localVariableNillableHeaders: [String: Any?] = [
            "X-API-KEY": apiKey,
            "Content-Type": "application/json"
        ]
        
        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)
        
        let localVariableRequestBuilder: RequestBuilder<MovieResponseModel>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()
        
        return localVariableRequestBuilder.init(
            method: "GET",
            URLString: (urlComponents?.string ?? localVariableURLString),
            parameters: nil,
            headers: localVariableHeaderParameters,
            requiresAuthentication: true
        )
    }
}

// Factory(Фабрика)
class RequestFactory {
    static func createPossibleValuesRequest(field: String) -> RequestBuilder<[PossibleValueModel]> {
        return KinopoiskAPI.possibleValuesGetWithRequestBuilder(field: field)
    }

    static func createSearchFilmsRequest(query: String, page: Int, limit: Int) -> RequestBuilder<MovieResponseModel> {
        return KinopoiskAPI.searchFilmsGetWithRequestBuilder(query: query, page: page, limit: limit)
    }

    static func createPostersRequest(movieId: [String], type: [String], language: [String], height: [String], width: [String], updatedAt: [String], createdAt: [String], page: Int, limit: Int) -> RequestBuilder<MovieResponseModel> {
        return KinopoiskAPI.posterGetWithRequestBuilder(movieId: movieId, type: type, language: language, height: height, width: width, updatedAt: updatedAt, createdAt: createdAt, page: page, limit: limit)
    }
}

