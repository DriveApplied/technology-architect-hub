#!/bin/bash

# Set the repository name
# repo_name="enterprise-app-architect-hub"

# Create the repository directory
# mkdir "$repo_name"
# cd "$repo_name"

# Create the numbered folders and Markdown pages
folders_and_pages=(
    "1-architecture-designs:architecture-diagrams,system-design,network-design,data-architecture,application-design"
    "2-templates:architecture-templates,documentation-templates,diagram-templates,process-templates"
    "3-research:whitepapers,case-studies,market-research,trend-analysis"
    "4-guidance:best-practices,standards,methodologies,reference-guides"
    "5-documentation:project-documentation,system-documentation,governance-documents,compliance-documents"
    "6-tools:enterprise-architecture-software,modeling-tools,analysis-tools"
    "7-resources:books,online-courses,articles,webinars"
    "8-contributions:contributed-designs,community-contributions,collaboration-requests"
    "9-license-and-legal:license-information,legal-documents,copyright-notices"
)

for folder_and_page in "${folders_and_pages[@]}"; do
    IFS=':' read -r folder_name page_items <<< "$folder_and_page"
    
    mkdir "$folder_name"
    echo "# $folder_name" > "$folder_name/index.md"
    echo "" >> "$folder_name/index.md"
    echo "This folder contains resources related to $folder_name." >> "$folder_name/index.md"
    echo "" >> "$folder_name/index.md"
    echo "## Contents" >> "$folder_name/index.md"
    echo "" >> "$folder_name/index.md"
    
    IFS=',' read -ra items <<< "$page_items"
    for item in "${items[@]}"; do
        echo "- [$item](#$item)" >> "$folder_name/index.md"
    done
done

# Display a message indicating the structure has been created
echo "Folder structure with numbered folders and Markdown pages created successfully."

