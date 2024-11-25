//
//  SegmentedPageViewController.swift
//  MarketKurly
//
//  Created by 이세민 on 11/26/24.
//

import UIKit

import SnapKit

class SegmentedPageViewController: UIViewController {
    
    private lazy var segmentController: UISegmentedControl = {
        let segment = UnderlineSegmentedControl(items: ["상품설명", "상세정보", "후기", "문의"])
        segment.selectedSegmentIndex = 0
        return segment
    }()
    
    private lazy var pageViewController: UIPageViewController = {
        let vc = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        vc.dataSource = self
        vc.delegate = self
        return vc
    }()
    
    private lazy var viewControllers: [UIViewController] = {
        let detailVC = DetailViewController()
        
        return [detailVC]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setStyle()
        setLayout()
        setupPageViewController()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .gray2
    }
    
    private func setUI() {
        addChild(pageViewController)
        view.addSubviews(segmentController, pageViewController.view)
        pageViewController.didMove(toParent: self)
    }
    
    private func setLayout() {
        segmentController.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview().inset(19)
            $0.height.equalTo(40)
        }
        
        pageViewController.view.snp.makeConstraints {
            $0.top.equalTo(segmentController.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setupPageViewController() {
        if let firstVC = viewControllers.first {
            pageViewController.setViewControllers([firstVC],
                                                  direction: .forward,
                                                  animated: true)
        }
    }
    
    private func setupSegmentControl() {
        segmentController.addTarget(self,
                                    action: #selector(segmentChanged(_:)),
                                    for: .valueChanged)
    }
    
    @objc private func segmentChanged(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        let direction: UIPageViewController.NavigationDirection = index > (pageViewController.viewControllers?.first.flatMap { viewControllers.firstIndex(of: $0) } ?? 0) ? .forward : .reverse
        
        pageViewController.setViewControllers([viewControllers[index]],
                                              direction: direction,
                                              animated: true)
    }
}

extension SegmentedPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: viewController), index > 0 else { return nil }
        return viewControllers[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: viewController), index < viewControllers.count - 1 else { return nil }
        return viewControllers[index + 1]
    }
}

extension SegmentedPageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard completed,
              let currentVC = pageViewController.viewControllers?.first,
              let index = viewControllers.firstIndex(of: currentVC) else { return }
        
        segmentController.selectedSegmentIndex = index
    }
}
