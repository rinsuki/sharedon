app
    .container
        h1 Mastodonで共有
        .panel
            form(onsubmit="{onsubmit}")
                input(type="text",ref="custom",placeholder="あなたのインスタンスホスト名を入力(例: mstdn.jp)",pattern="^[0-9a-z\.]+$")
                input(type="submit",value="→")
            ul
                li(each="{domain in this.default_domains}")
                    a(href="https://{domain}/share?text={encodeURIComponent(this.text)}") {domain}
        .panel#share_content
            span 共有する内容: 
            textarea(readonly) {this.text}
        .right
            a(href="https://github.com/rinsuki/sharedon",style="color:#9baec8") ShareDonのソースコード
    style.
        .container {
            max-width: 640px;
            margin: 0 auto;
        }
        app {
            display: block;
        }
        .panel {
            background: #d9e1e8;
            color: #282c37;
            margin-bottom: 1em;
        }
        form {
            display:flex;
        }
        input[type="text"] {
            flex:1;
        }
        input[type="submit"] {
            border:none;
            background: #2b90d9;
            color: #d9e1e8;
            padding: 0 1em;
        }
        input {
            display:block;
            padding: 0.5em 0.25em;
            font-size: 120%;
            box-sizing: border-box;
        }
        textarea {
            display: block;
            font-size: 120%;
            width: 100%;
            box-sizing: border-box;
            resize: vertical;
        }
        ul {
            margin: 0;
            padding:0;
        }
        li > a {
            display: block;
            padding: 0.5em 1em;
        }
        #share_content > *{
            display: block;
            padding: 0.5em;
        }
        .right {
            text-align: right;
        }
    script.
        this.default_domains = [
            "mstdn.jp",
            "friends.nico",
            "pawoo.net",
            "mastodon.social"
        ]
        this.text = "あぴょあぴょあぴょ~~~~"
        // query string parse
        var queries = location.search.slice(1).split("&")
        var query_dic = {}
        queries.forEach(function(query) {
            var _ = query.split("=")
            var name = _[0]
            var value = _.slice(1).join("=")
            query_dic[name] = decodeURIComponent(value)
        })
        this.text = query_dic.text
        var self=this
        this.onsubmit = function(e) {
            e.preventDefault()
            self.go(self.refs.custom.value)
        }
        this.go = function(domain) {
            location.href="https://"+domain+"/share?text="+encodeURIComponent(query_dic.text)
        }
        this.go_func = function(domain) {
            return function() {
                self.go(domain)
            }
        }