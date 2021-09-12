//
//  NiblessUITableViewCell.swift
//  Carlist
//
//  Created by Jake Lin on 12/9/21.
//

import UIKit

open class NiblessUITableViewCell: UITableViewCell {
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    @available(*, unavailable,
      message: "Loading this UITableviewCell from a nib is unsupported in favor of initializer dependency injection."
    )
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Loading this UITableviewCell from a nib is unsupported in favor of initializer dependency injection.")
    }
}

