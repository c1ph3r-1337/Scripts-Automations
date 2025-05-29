#!/bin/bash

# Define frames with slight vertical shifts for bouncing effect
frames=(
$'
				          _
				       	 / \
				      _ |   | _
				  _  / \|   |/ \
				 / \|   |   |   ||\
				|   |   |   |   | \>
				|   |   |   |   |   \
				| -   -   -   - |)   )
				|                   /
				 \                 /
				  \               /
				   \             /
				    \           /
'
$'
				         / \
				        |\_/|
				        |---|
				        |   |
				        |   |
				      _ |=-=| _
				  _  / \|   |/ \
				 / \|   |   |   ||\
				|   |   |   |   | \>
				|   |   |   |   |   \
				| -   -   -   - |)   )
				|                   /
				 \                 /
				  \               /
				   \             /
				    \           /
'
)

# Animation loop to simulate the bouncing
while true; do
    for frame in "${frames[@]}"; do
        clear
        echo "$frame"
        sleep 0.5
    done
done
