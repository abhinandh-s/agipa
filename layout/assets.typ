#let bundle-assets() = {
  asset("css/style.css", read("/static/css/style.css"))
  asset("css/variables.css", read("/static/css/variables.css"))
  asset("css/base.css", read("/static/css/base.css"))
  asset("css/components.css", read("/static/css/components.css"))
  asset("css/comment-box.css", read("/static/css/comment-box.css"))
  asset("js/theme.js", read("/static/js/theme.js")) 
  asset("js/sidebar.js", read("/static/js/sidebar.js")) 
  asset("js/comment-box.js", read("/static/js/comment-box.js")) 
  asset("favicon.ico", read("/images/favicon.ico", encoding: none))
}
