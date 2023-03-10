package intern

class ProductColor {
    Product product
    Color color
    ColorStatus status
    static belongsTo = [
            product: Product,
            color: Color
    ]

    static constraints = {
    }

    static enum ColorStatus {
        READY, HOLD, EMPTY
    }
}
