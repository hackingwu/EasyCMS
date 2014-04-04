function typechange(v) {
    if ("unit" == v) {
        $("#unitid").fadeIn("slow");
        $("#userid").fadeOut("slow");
    } else {
        $("#userid").fadeIn("slow");
        $("#unitid").fadeOut("slow");
    }
}