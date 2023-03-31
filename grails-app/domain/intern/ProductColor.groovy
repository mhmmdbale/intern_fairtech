package intern

import org.springframework.transaction.annotation.Transactional


class ProductColor {
    Product product
    Color color
    ColorStatus status
    static belongsTo = [
            product: Product,
            color: Color
    ]

    static constraints = {
        status nullable: true
    }

    static enum ColorStatus {
        READY, PREORDER, EMPTY
    }

    @Transactional
    static ProductColor create(Product product, Color color, boolean flush = false) {
        def instance = new ProductColor(product: product, color: color, status: ColorStatus.READY)
        instance.save()
        instance
    }
}
