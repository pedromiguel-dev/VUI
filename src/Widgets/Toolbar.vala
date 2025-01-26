namespace Vui {

    public class Widget.ToolBar : Impl.View {

        private HeaderBar default_headerbar = new HeaderBar ();

        private Adw.ToolbarView toolbar_widget = new Adw.ToolbarView ();

        private Widget.VBox content_box = new Widget.VBox () {
            valign = Gtk.Align.FILL,
            halign = Gtk.Align.FILL,
        };

        private Widget.HBox title_page_box;

        public Impl.View top_bar {
            set {
                this.destination = value.destination;
                default_headerbar.unparent ();
                toolbar_widget.add_top_bar (value);
            }
        }

        public Impl.View bottom_bar {
            set {
                this.destination = value.destination;
                toolbar_widget.add_bottom_bar (value);
            }
        }

        public Impl.View content {
            set {
                this.destination = value.destination;
                content_box.append (value);
            }
        }

        public bool show_title {
            set {
                this.default_headerbar.show_title = value;
            }
        }

        public Impl.View[] make_title {
            set {
                if (title_page_box == null) {
                    this.set_big_title ();
                }
                var temp = new HBox () {
                    content = value,
                    hexpand = true,
                    halign = Gtk.Align.END
                };

                this.title_page_box.append (temp);
            }
        }

        public new int margin_top {
            get { return this.content_box.margin_top; }
            set { this.content_box.margin_top = value; }
        }

        public new int margin_start {
            get { return this.content_box.margin_start; }
            set { this.content_box.margin_start = value; }
        }

        public new int margin_bottom {
            get { return this.content_box.margin_bottom; }
            set { this.content_box.margin_bottom = value; }
        }

        public new int margin_end {
            get { return this.content_box.margin_end; }
            set { this.content_box.margin_end = value; }
        }

        private void set_big_title () {
            this.title_page_box = new HBox () {
                margin_bottom = 10,
                spacing = 10
            };

            var temp = new Widget.Label (this.title) {
                css_classes = { "title-1", "title-bigger" },
                halign = Gtk.Align.START,
                valign = Gtk.Align.CENTER,
            };

            this.title_page_box.append (temp);
            this.content_box.prepend (title_page_box);
        }

        public ToolBar (string title, bool big_title = false) {
            this.title = title;
            toolbar_widget.add_top_bar (default_headerbar);
            toolbar_widget.set_content (content_box);
            this.set_widget (toolbar_widget);
        }
    }
}
