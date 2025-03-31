;; gene-market.clar
(impl-trait .gene-asset-trait.gene-asset-trait)

;; Constants
(define-constant ERR-NOT-AUTHORIZED (err u100))
(define-constant ERR-INVALID-PRICE (err u101))
(define-constant ERR-ASSET-NOT-FOUND (err u102))
(define-constant ERR-INSUFFICIENT-BALANCE (err u103))

;; Data maps
(define-map gene-assets
    { asset-id: uint }
    {
        owner: principal,
        price: uint,
        data-contract: principal,
        data-id: uint,
        active: bool,
        access-tier: uint,
        gene-hash: (buff 32)
    }
)

(define-map gene-access
    { researcher: principal, asset-id: uint }
    {
        access-time: uint,
        access-expiry: uint,
        access-tier: uint
    }
)

;; Administrative functions
(define-data-var market-curator principal tx-sender)
(define-public (set-curator (new-curator principal))
    (begin
        (asserts! (is-eq tx-sender (var-get market-curator)) ERR-NOT-AUTHORIZED)
        (ok (var-set market-curator new-curator))
    )
)

;; Implement trait functions
(define-public (get-gene-details (asset-id uint))
    (match (map-get? gene-assets { asset-id: asset-id })
        asset (ok {
            owner: (get owner asset),
            price: (get price asset),
            access-tier: (get access-tier asset),
            gene-hash: (get gene-hash asset)
        })
        (err u404)
    )
)

(define-public (verify-gene-access (asset-id uint) (researcher principal))
    (match (map-get? gene-access { researcher: researcher, asset-id: asset-id })
        access-data (ok (< block-height (get access-expiry access-data)))
        (err u404)
    )
)

(define-public (grant-gene-access (asset-id uint) (researcher principal) (access-tier uint))
    (begin
        (asserts! (is-eq tx-sender (var-get market-curator)) ERR-NOT-AUTHORIZED)
        (map-set gene-access
            { researcher: researcher, asset-id: asset-id }
            {
                access-time: block-height,
                access-expiry: (+ block-height u8640),
                access-tier: access-tier
            }
        )
        (ok true)
    )
)