function l
  if command -v lsd  
    lsd -lah
  else
    echo "Consider installing lsd: "
    echo "cargo install lsd"
    echo ""
    ls -lah
  end
end
