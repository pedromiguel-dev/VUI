namespace Vui {

    public class Widget.ToolBar : Impl.View {

        private HeaderBar default_headerbar = new HeaderBar ();

        private Adw.ToolbarView toolbar_widget = new Adw.ToolbarView ();

        private Widget.HBox title_page_box = new HBox () {
            margin_bottom = 10,
            spacing = 10
        };

        private Widget.Box content_box;

        public Impl.View top_bar {
            set {
                this.destination = value.destination;
                toolbar_widget.remove (default_headerbar);
                toolbar_widget.add_top_bar (value);
            }
        }

        public Impl.View bottom_bar {
            set {
                this.destination = value.destination;
                toolbar_widget.add_bottom_bar (value);
            }
        }

        public Widget.Box content {
            set {
                this.destination = value.destination;
                content_box = value;
                content_box.prepend (title_page_box);
                toolbar_widget.set_content (content_box);
            }
        }

        public bool show_headerbar_title {
            set {
                this.default_headerbar.show_title = value;
            }
        }

        public Impl.View[] make_title {
            set {
                this.title_page_box.append (new Widget.Label (this.title) {
                    css_classes = { "title-1", "title-bigger" },
                    halign = Gtk.Align.START,
                    valign = Gtk.Align.CENTER,
                });
                this.title_page_box.append (new HBox () {
                    content = value,
                    hexpand = true,
                    halign = Gtk.Align.END
                });
            }
        }

        ~ToolBar () {
            toolbar_widget.unparent ();
        }

        public ToolBar (string title) {
            this.title = title;
            toolbar_widget.add_top_bar (default_headerbar);
            this.set_widget (toolbar_widget);
        }
    }
}
