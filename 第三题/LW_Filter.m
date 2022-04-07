function I_LW = LW_Filter(image)
    [thr, sorh, keepapp] = ddencmp('den', 'wv', image);
    I_LW = wdencmp('gbl', image, 'sym4', 2, thr, sorh, keepapp);
end