package intern

class Color {
    String code
    String name
    static hasMany = [productColors: ProductColor]
    static constraints = {
        code blank: false, nullable: false, unique: true
        name blank: false, nullable: false, unique: true
    }
}
