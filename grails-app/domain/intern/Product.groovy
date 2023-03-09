package intern

class Product {
    String code
    String name
    ProductType type
    ProductSleeve sleeve
    Integer price
    String photo
    static hasMany = [productColors: ProductColor]

    static constraints = {
        code blank: false, nullable: false
        name blank: false, nullable: false
        type blank: false, nullable: false
        sleeve blank: false, nullable: false
        price blank: false, nullable: false
        photo nullable: true
    }

    static enum ProductType {
        KAOS, JAKET, SWEETER
    }
    static enum ProductSleeve {
        PANJANG, PENDEK
    }
}
