import Foundation

public extension UserDefaults {
    class Key {
        public let string: String
        public init(_ key: String) { string = key }
    }
    
    class OptionalKey<T>: Key {}
    class DefaultKey<T>: Key {
        public let defaultValue: T
        public init(_ key: String, default value: T) { defaultValue = value; super.init(key) }
    }
}

public extension UserDefaults {
    // MARK: - Remove by Key
    func removeObject(forKey key: Key) {
        removeObject(forKey: key.string)
    }
    
    // MARK: - Access with Key
    subscript<T>(key: DefaultKey<T>) -> T {
        set { set(newValue, forKey: key.string) }
        get {
            return object(forKey: key.string) as? T ?? key.defaultValue
        }
    }
    
    subscript<T>(key: OptionalKey<T>) -> T? {
        set { set(newValue, forKey: key.string) }
        get {
            return object(forKey: key.string) as? T
        }
    }

    subscript(key: OptionalKey<Float>) -> Float? {
        set { set(newValue, forKey: key.string) }
        get {
            // `object(forKey: key.string) as? Float` no longer works since Swift 4.2
            guard let dbl = object(forKey: key.string) as? Double else { return nil }
            return Float(dbl)
        }
    }
}

// MARK: - Special treatment for Bool, Int, Float, Double, and URL
public extension UserDefaults {
    
    subscript(key: DefaultKey<Bool>) -> Bool {
        set { set(newValue, forKey: key.string) }
        get {
            return object(forKey: key.string) == nil ?
                key.defaultValue : bool(forKey: key.string)
        }
    }
    
    subscript(key: DefaultKey<Int>) -> Int {
        set { set(newValue, forKey: key.string) }
        get {
            return object(forKey: key.string) == nil ?
                key.defaultValue : integer(forKey: key.string)
        }
    }
    
    subscript(key: DefaultKey<Float>) -> Float {
        set { set(newValue, forKey: key.string) }
        get {
            return object(forKey: key.string) == nil ?
                key.defaultValue : float(forKey: key.string)
        }
    }
    
    subscript(key: DefaultKey<Double>) -> Double {
        set { set(newValue, forKey: key.string) }
        get {
            return object(forKey: key.string) == nil ?
                key.defaultValue : double(forKey: key.string)
        }
    }

    subscript(key: DefaultKey<URL>) -> URL {
        set { set(newValue, forKey: key.string) }
        get {
            return url(forKey: key.string) ?? key.defaultValue
        }
    }

    subscript(key: OptionalKey<URL>) -> URL? {
        set { set(newValue, forKey: key.string) }
        get {
            return url(forKey: key.string)
        }
    }
}
