#!/usr/bin/env python3
import json

def main():
    print(json.dumps({
        "egress_rule_name": "allow-egress-to-gke-master",
        "internal_rule_name": "allow-internal-node-pod"
    }))

if __name__ == "__main__":
    main()
