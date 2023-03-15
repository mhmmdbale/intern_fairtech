package intern
import grails.validation.Validateable

class Color {
    String code
    String name
    static hasMany = [productColors: ProductColor]
    static constraints = {
        code blank: false, nullable: false, unique: true, ignoreIf: { obj -> obj.id != null }
        name blank: false, nullable: false
    }
}
