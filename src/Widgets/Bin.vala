/**
 * Minimal single-child wrapper for Granite 7.4 compatibility.
 */
public class Jorts.Bin : Gtk.Widget {

    private Gtk.Widget? _child;

    public Gtk.Widget? child {
        get { return _child; }
        set {
            if (_child == value) {
                return;
            }

            if (_child != null) {
                _child.unparent ();
            }

            _child = value;

            if (_child != null) {
                _child.set_parent (this);
            }
        }
    }

    construct {
        layout_manager = new Gtk.BinLayout ();
    }

    protected override void dispose () {
        child = null;
        base.dispose ();
    }
}
