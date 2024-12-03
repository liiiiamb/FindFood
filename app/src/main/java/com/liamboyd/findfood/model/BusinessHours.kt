data class BusinessHours(
    val hours_type: String,
    val is_open_now: Boolean,
    val `open`: List<Open>
)