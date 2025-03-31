(define-trait gene-asset-trait
    (
        ;; Get gene asset details
        (get-gene-details (uint) (response 
            {
                owner: principal,
                price: uint,
                access-tier: uint,
                gene-hash: (buff 32)
            } 
            uint))
        ;; Verify gene access
        (verify-gene-access (uint principal) (response bool uint))
        ;; Grant gene access
        (grant-gene-access (uint principal uint) (response bool uint))
    )
)