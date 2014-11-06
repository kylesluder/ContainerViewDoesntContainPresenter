ContainerViewDoesntContainPresenter
===

UIPresentationController.containerView is documented to be an ancestor of both the presenting and presented view controllers:

"""The container view is always an ancestor of both the presenting view controller’s view and the presented view controller’s view."""

This is not true, though I would very much like it to be.

I'm trying to set the tintAdjustmentMode of the presenting view controller so that its controls don't appear to be enabled during my custom presentation. My intended path was to set the tintAdjustmentMode of the container view to Dimmed, and then set the tintAdjustmentMode of the presented view controller's view to Normal.

Unfortunately, this doesn't work because the containerView never winds up being an ancestor of the presenting view controller. It only ever contains the presented view controller.


Steps to reproduce
---

1. Build and run the attached demo application.

2. Tap the button to present a view controller.


Expected results
---

Both buttons turn purple.


Actual results
---

Only the button inside the presented view controller is purple.


Version
---

iOS 8.1 (12B411)