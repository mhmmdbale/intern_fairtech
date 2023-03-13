package intern
import grails.validation.Validateable

class Color {
    String code
    String name
    static hasMany = [productColors: ProductColor]
    static constraints = {
        code blank: false, nullable: false, unique: true
        name blank: false, nullable: false
        // Add a custom validator for the 'name' field
//        name validator: { val, obj ->
//            def existing = Color.findByName(val)
//            if (existing && existing.id != obj.id) {
//                return ['unique', 'color.name']
//            }
//        }
        // Add a custom validator for the 'code' field
//        code validator: { val, obj ->
//            def existing = Color.findByCode(val)
//            if (existing && existing.id != obj.id) {
//                return ['unique', 'color.code']
//            }
//        }
    }
}
