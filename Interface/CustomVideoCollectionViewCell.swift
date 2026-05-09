//
//  CustomVideoCollectionViewCell.swift
//  Nexus
//
//  Created by Zacc Konfor on 5/5/26.
//

import UIKit
import AVFoundation

class CustomVideoCollectionViewCell: UICollectionViewCell {
    static let identifier = "VideoCollectionViewCell"
    
    //Labels
    private var usernameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    private var captionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    private var audioLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    //Buttons
    private let profileButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "person.circle.fill"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    public lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private let commentButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "text.bubble.fill"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "arrowshape.turn.up.right.fill"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    //Subviews
    var player: AVPlayer?
    private var model: VideoModel?
    private let videoContainer = CustomView()
    
    //properties
    var onButtonTap: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .darkGray
        contentView.clipsToBounds = true
        addSubviews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        videoContainer.frame = contentView.bounds
        
        let size = contentView.frame.size.width/9
        let width = contentView.frame.size.width
        let height = contentView.frame.size.height - 150
        
        //Buttons
        shareButton.frame = CGRect(x: width-size, y: height-size, width: size, height: size)
        commentButton.frame = CGRect(x: width-size, y: height-(size*2)-10, width: size, height: size)
        likeButton.frame = CGRect(x: width-size, y: height-(size*3)-10, width: size, height: size)
        profileButton.frame = CGRect(x: width-size, y: height-(size*4)-10, width: size, height: size)
        
        //Labels
        audioLabel.frame = CGRect(x: 5, y: height, width: width-size-10, height: 50)
        captionLabel.frame = CGRect(x: 5, y: height-20, width: width-size-10, height: 50)
        usernameLabel.frame = CGRect(x: 5, y: height-50, width: width-size-10, height: 50)
        
    }
    
       public func playVideo() {
            player?.play()
        }
        
        public func pauseVideo() {
            player?.pause()
        }
    
    public func updateLikeButtonState(isSelected: Bool) {
           //Update color based on saved state
        likeButton.tintColor = isSelected ? .red : .white
       }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        usernameLabel.text = nil
        captionLabel.text = nil
        audioLabel.text = nil
        likeButton.tintColor = .white
        pauseVideo()
        player = nil
    }
    
    
//Mark:- selectors
    @objc private func didTapLikeButton() {
        
        let isCurrentColor = likeButton.tintColor == .white
        let newColor = isCurrentColor ? UIColor.red : UIColor.white
        likeButton.tintColor = newColor
        
        UIView.animate(withDuration: 0.1, animations: {
            self.likeButton.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                }) { _ in
                    UIView.animate(withDuration: 0.1) {
                        self.likeButton.transform = .identity
                    }
                }
        onButtonTap?()
        print("like clicked")
    }
    
    @objc private func didTapProfileButton() {
        print("Profile clicked")
    }
    
    @objc private func didTapShareButton() {
        print("share clicked")
    }
    
    @objc private func didTapCommentButton() {
        print("comment clicked")
    }
    
    public func configure(with model: VideoModel ) {
        self.model = model
        configureVideo()
        
        //Labels
        usernameLabel.text = model.username
        captionLabel.text = model.caption
        audioLabel.text = model.audioTrackName
    }
    
    private func configureVideo() {
        guard let model = model else {return}
        guard let path = Bundle.main.path(forResource: model.videoFileName, ofType: model.videoFileFormat) else {
            print("failed to find video")
            return}
        
        player = AVPlayer(url: URL(fileURLWithPath: path))
        
        let playerView = AVPlayerLayer()
        playerView.player = player
        playerView.frame = contentView.bounds
        playerView.videoGravity = .resizeAspectFill
        videoContainer.layer.addSublayer(playerView)
        player?.volume = 0
        playVideo()
        
    }
    
    private func addSubviews() {
        
        contentView.addSubview(videoContainer)
        videoContainer.clipsToBounds = true
        contentView.sendSubviewToBack(videoContainer)
        
        contentView.addSubview(usernameLabel)
        contentView.addSubview(captionLabel)
        contentView.addSubview(audioLabel)
        contentView.addSubview(profileButton)
        contentView.addSubview(likeButton)
        contentView.addSubview(commentButton)
        contentView.addSubview(shareButton)
        
        
        profileButton.addTarget(self, action: #selector(didTapProfileButton), for: .touchUpInside)
        likeButton.addTarget(self, action: #selector(didTapLikeButton), for: .touchUpInside)
        commentButton.addTarget(self, action: #selector(didTapCommentButton), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(didTapShareButton), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
