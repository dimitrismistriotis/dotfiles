function l
  if command -v lsd  
    lsd -lah
  else
    ls -lah
  end
end
